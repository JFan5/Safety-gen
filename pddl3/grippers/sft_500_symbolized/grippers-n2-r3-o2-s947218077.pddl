(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_01 obj_08 - type_1
obj_09 obj_04 obj_03 obj_02 - type_2
obj_05 obj_10 obj_07 - type_3
obj_06 obj_11 - object)
(:init
(pred_1 obj_01 obj_05)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_04)
(pred_1 obj_08 obj_05)
(pred_3 obj_08 obj_03)
(pred_3 obj_08 obj_02)
(pred_2 obj_06 obj_05)
(pred_2 obj_11 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_05)
(pred_2 obj_11 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_01 obj_07)))
)
)