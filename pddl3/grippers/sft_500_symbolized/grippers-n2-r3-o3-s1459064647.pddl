(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_09 - type_1
obj_03 obj_06 obj_01 obj_04 - type_3
obj_12 obj_08 obj_02 - type_2
obj_11 obj_10 obj_07 - object)
(:init
(pred_4 obj_05 obj_12)
(pred_1 obj_05 obj_03)
(pred_1 obj_05 obj_06)
(pred_4 obj_09 obj_08)
(pred_1 obj_09 obj_01)
(pred_1 obj_09 obj_04)
(pred_3 obj_11 obj_02)
(pred_3 obj_10 obj_12)
(pred_3 obj_07 obj_12)
)
(:goal
(and
(pred_3 obj_11 obj_12)
(pred_3 obj_10 obj_12)
(pred_3 obj_07 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_02)))
)
)