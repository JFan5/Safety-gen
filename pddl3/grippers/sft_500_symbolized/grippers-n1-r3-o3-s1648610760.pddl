(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_02 obj_09 - type_2
obj_07 obj_05 obj_04 - type_3
obj_03 obj_06 obj_08 - object)
(:init
(pred_1 obj_01 obj_05)
(pred_3 obj_01 obj_02)
(pred_3 obj_01 obj_09)
(pred_2 obj_03 obj_05)
(pred_2 obj_06 obj_05)
(pred_2 obj_08 obj_07)
)
(:goal
(and
(pred_2 obj_03 obj_05)
(pred_2 obj_06 obj_05)
(pred_2 obj_08 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_01 ?b obj_09))))
)
)