(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_02 - type_1
obj_05 obj_11 obj_04 obj_07 - type_2
obj_10 obj_01 obj_08 obj_09 - type_3
obj_13 obj_06 obj_03 - object)
(:init
(pred_1 obj_12 obj_08)
(pred_3 obj_12 obj_05)
(pred_3 obj_12 obj_11)
(pred_1 obj_02 obj_08)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_07)
(pred_2 obj_13 obj_01)
(pred_2 obj_06 obj_10)
(pred_2 obj_03 obj_01)
)
(:goal
(and
(pred_2 obj_13 obj_01)
(pred_2 obj_06 obj_01)
(pred_2 obj_03 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_01)))
)
)