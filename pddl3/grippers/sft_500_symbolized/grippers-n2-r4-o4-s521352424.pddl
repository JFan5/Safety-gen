(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_3
obj_12 obj_13 obj_06 obj_11 - type_1
obj_03 obj_02 obj_04 obj_10 - type_2
obj_08 obj_14 obj_05 obj_07 - object)
(:init
(pred_3 obj_09 obj_10)
(pred_1 obj_09 obj_12)
(pred_1 obj_09 obj_13)
(pred_3 obj_01 obj_03)
(pred_1 obj_01 obj_06)
(pred_1 obj_01 obj_11)
(pred_4 obj_08 obj_03)
(pred_4 obj_14 obj_04)
(pred_4 obj_05 obj_03)
(pred_4 obj_07 obj_03)
)
(:goal
(and
(pred_4 obj_08 obj_03)
(pred_4 obj_14 obj_03)
(pred_4 obj_05 obj_04)
(pred_4 obj_07 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_04)))
)
)