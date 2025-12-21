(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_07 obj_06 - type_3
obj_04 obj_09 obj_05 obj_03 - type_2
obj_10 obj_02 obj_01 - object)
(:init
(pred_4 obj_08 obj_03)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_06)
(pred_3 obj_10 obj_04)
(pred_3 obj_02 obj_03)
(pred_3 obj_01 obj_09)
)
(:goal
(and
(pred_3 obj_10 obj_09)
(pred_3 obj_02 obj_03)
(pred_3 obj_01 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_08 ?b obj_06))))
)
)