(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_09 obj_04 - type_3
obj_01 obj_03 obj_05 obj_07 - type_2
obj_10 obj_06 obj_02 - object)
(:init
(pred_3 obj_08 obj_03)
(pred_4 obj_08 obj_09)
(pred_4 obj_08 obj_04)
(pred_2 obj_10 obj_07)
(pred_2 obj_06 obj_05)
(pred_2 obj_02 obj_07)
)
(:goal
(and
(pred_2 obj_10 obj_05)
(pred_2 obj_06 obj_03)
(pred_2 obj_02 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_08 ?b obj_09))))
)
)