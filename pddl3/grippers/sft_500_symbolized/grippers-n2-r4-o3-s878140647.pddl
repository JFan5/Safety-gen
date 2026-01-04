(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_05 - type_1
obj_10 obj_11 obj_09 obj_02 - type_2
obj_06 obj_08 obj_01 obj_03 - type_3
obj_12 obj_13 obj_07 - object)
(:init
(pred_2 obj_04 obj_08)
(pred_4 obj_04 obj_10)
(pred_4 obj_04 obj_11)
(pred_2 obj_05 obj_03)
(pred_4 obj_05 obj_09)
(pred_4 obj_05 obj_02)
(pred_1 obj_12 obj_01)
(pred_1 obj_13 obj_03)
(pred_1 obj_07 obj_01)
)
(:goal
(and
(pred_1 obj_12 obj_06)
(pred_1 obj_13 obj_08)
(pred_1 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_2 obj_04 obj_01)))
)
)