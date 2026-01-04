(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_02 - type_1
obj_05 obj_07 obj_08 obj_01 - type_2
obj_06 obj_10 obj_04 - type_3
obj_11 obj_03 obj_09 - object)
(:init
(pred_3 obj_12 obj_06)
(pred_1 obj_12 obj_05)
(pred_1 obj_12 obj_07)
(pred_3 obj_02 obj_06)
(pred_1 obj_02 obj_08)
(pred_1 obj_02 obj_01)
(pred_4 obj_11 obj_04)
(pred_4 obj_03 obj_06)
(pred_4 obj_09 obj_10)
)
(:goal
(and
(pred_4 obj_11 obj_06)
(pred_4 obj_03 obj_06)
(pred_4 obj_09 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_04)))
)
)