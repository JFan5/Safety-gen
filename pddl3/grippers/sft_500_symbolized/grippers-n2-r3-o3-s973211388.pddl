(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_09 - type_1
obj_11 obj_06 obj_01 obj_10 - type_2
obj_07 obj_02 obj_04 - type_3
obj_05 obj_08 obj_03 - object)
(:init
(pred_3 obj_12 obj_04)
(pred_1 obj_12 obj_11)
(pred_1 obj_12 obj_06)
(pred_3 obj_09 obj_04)
(pred_1 obj_09 obj_01)
(pred_1 obj_09 obj_10)
(pred_4 obj_05 obj_07)
(pred_4 obj_08 obj_04)
(pred_4 obj_03 obj_07)
)
(:goal
(and
(pred_4 obj_05 obj_07)
(pred_4 obj_08 obj_02)
(pred_4 obj_03 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_02)))
)
)