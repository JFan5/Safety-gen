(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_02 - type_1
obj_03 obj_10 obj_07 obj_01 - type_3
obj_13 obj_09 obj_11 obj_04 - type_2
obj_12 obj_14 obj_08 obj_06 - object)
(:init
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_03)
(pred_2 obj_05 obj_10)
(pred_4 obj_02 obj_13)
(pred_2 obj_02 obj_07)
(pred_2 obj_02 obj_01)
(pred_3 obj_12 obj_09)
(pred_3 obj_14 obj_11)
(pred_3 obj_08 obj_11)
(pred_3 obj_06 obj_09)
)
(:goal
(and
(pred_3 obj_12 obj_09)
(pred_3 obj_14 obj_04)
(pred_3 obj_08 obj_11)
(pred_3 obj_06 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_04)))
)
)