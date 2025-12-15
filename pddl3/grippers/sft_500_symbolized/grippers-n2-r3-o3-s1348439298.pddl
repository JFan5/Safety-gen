(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_10 - type_1
obj_02 obj_07 obj_08 obj_09 - type_2
obj_03 obj_12 obj_04 - type_3
obj_05 obj_01 obj_06 - object)
(:init
(pred_4 obj_11 obj_12)
(pred_3 obj_11 obj_02)
(pred_3 obj_11 obj_07)
(pred_4 obj_10 obj_12)
(pred_3 obj_10 obj_08)
(pred_3 obj_10 obj_09)
(pred_1 obj_05 obj_03)
(pred_1 obj_01 obj_03)
(pred_1 obj_06 obj_12)
)
(:goal
(and
(pred_1 obj_05 obj_12)
(pred_1 obj_01 obj_03)
(pred_1 obj_06 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_04)))
)
)