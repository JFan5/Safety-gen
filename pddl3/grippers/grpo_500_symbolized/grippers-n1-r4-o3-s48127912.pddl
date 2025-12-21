(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_05 obj_03 - type_3
obj_04 obj_07 obj_06 obj_09 - type_2
obj_10 obj_08 obj_01 - object)
(:init
(pred_4 obj_02 obj_04)
(pred_2 obj_02 obj_05)
(pred_2 obj_02 obj_03)
(pred_3 obj_10 obj_07)
(pred_3 obj_08 obj_09)
(pred_3 obj_01 obj_09)
)
(:goal
(and
(pred_3 obj_10 obj_09)
(pred_3 obj_08 obj_09)
(pred_3 obj_01 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_02 ?b obj_03))))
)
)