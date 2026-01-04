(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_09 - type_1
obj_06 obj_10 obj_12 obj_01 - type_2
obj_04 obj_07 obj_02 - type_3
obj_08 obj_11 obj_03 - object)
(:init
(pred_1 obj_05 obj_07)
(pred_4 obj_05 obj_06)
(pred_4 obj_05 obj_10)
(pred_1 obj_09 obj_02)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_01)
(pred_3 obj_08 obj_04)
(pred_3 obj_11 obj_02)
(pred_3 obj_03 obj_07)
)
(:goal
(and
(pred_3 obj_08 obj_02)
(pred_3 obj_11 obj_02)
(pred_3 obj_03 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_02)))
)
)