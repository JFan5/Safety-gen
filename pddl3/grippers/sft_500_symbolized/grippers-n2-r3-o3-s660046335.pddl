(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_1
obj_11 obj_07 obj_04 obj_05 - type_2
obj_10 obj_01 obj_08 - type_3
obj_06 obj_02 obj_12 - object)
(:init
(pred_3 obj_09 obj_10)
(pred_1 obj_09 obj_11)
(pred_1 obj_09 obj_07)
(pred_3 obj_03 obj_10)
(pred_1 obj_03 obj_04)
(pred_1 obj_03 obj_05)
(pred_4 obj_06 obj_01)
(pred_4 obj_02 obj_10)
(pred_4 obj_12 obj_08)
)
(:goal
(and
(pred_4 obj_06 obj_10)
(pred_4 obj_02 obj_10)
(pred_4 obj_12 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_08)))
)
)