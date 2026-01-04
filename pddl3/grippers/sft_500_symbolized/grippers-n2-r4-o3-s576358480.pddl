(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_1
obj_08 obj_02 obj_01 obj_06 - type_2
obj_04 obj_03 obj_10 obj_11 - type_3
obj_05 obj_13 obj_07 - object)
(:init
(pred_4 obj_09 obj_03)
(pred_1 obj_09 obj_08)
(pred_1 obj_09 obj_02)
(pred_4 obj_12 obj_11)
(pred_1 obj_12 obj_01)
(pred_1 obj_12 obj_06)
(pred_3 obj_05 obj_10)
(pred_3 obj_13 obj_11)
(pred_3 obj_07 obj_10)
)
(:goal
(and
(pred_3 obj_05 obj_03)
(pred_3 obj_13 obj_10)
(pred_3 obj_07 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_10)))
)
)