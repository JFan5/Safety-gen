(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_3
obj_02 obj_04 obj_11 obj_06 - type_1
obj_07 obj_05 obj_09 - type_2
obj_03 obj_08 - object)
(:init
(pred_2 obj_10 obj_05)
(pred_3 obj_10 obj_02)
(pred_3 obj_10 obj_04)
(pred_2 obj_01 obj_05)
(pred_3 obj_01 obj_11)
(pred_3 obj_01 obj_06)
(pred_1 obj_03 obj_07)
(pred_1 obj_08 obj_09)
)
(:goal
(and
(pred_1 obj_03 obj_05)
(pred_1 obj_08 obj_07)
)
)

(:constraints
  (always (not (pred_2 obj_10 obj_09)))
)
)