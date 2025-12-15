(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_3
obj_10 obj_03 - type_2
obj_09 obj_06 obj_05 obj_07 - type_1
obj_01 obj_04 obj_08 - object)
(:init
(pred_1 obj_02 obj_07)
(pred_2 obj_02 obj_10)
(pred_2 obj_02 obj_03)
(pred_3 obj_01 obj_05)
(pred_3 obj_04 obj_09)
(pred_3 obj_08 obj_06)
)
(:goal
(and
(pred_3 obj_01 obj_05)
(pred_3 obj_04 obj_07)
(pred_3 obj_08 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_02 ?b obj_03))))
)
)