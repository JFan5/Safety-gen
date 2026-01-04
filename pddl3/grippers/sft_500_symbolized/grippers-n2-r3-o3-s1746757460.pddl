(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_11 - type_2
obj_01 obj_04 obj_05 obj_12 - type_3
obj_10 obj_08 obj_02 - type_1
obj_06 obj_03 obj_07 - object)
(:init
(pred_1 obj_09 obj_10)
(pred_3 obj_09 obj_01)
(pred_3 obj_09 obj_04)
(pred_1 obj_11 obj_08)
(pred_3 obj_11 obj_05)
(pred_3 obj_11 obj_12)
(pred_4 obj_06 obj_08)
(pred_4 obj_03 obj_10)
(pred_4 obj_07 obj_10)
)
(:goal
(and
(pred_4 obj_06 obj_10)
(pred_4 obj_03 obj_02)
(pred_4 obj_07 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_02)))
)
)