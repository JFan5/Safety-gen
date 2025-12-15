(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_08 - type_2
obj_01 obj_06 obj_07 obj_09 - type_1
obj_03 obj_11 obj_10 obj_13 - type_3
obj_02 obj_04 obj_05 - object)
(:init
(pred_4 obj_12 obj_11)
(pred_2 obj_12 obj_01)
(pred_2 obj_12 obj_06)
(pred_4 obj_08 obj_11)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_09)
(pred_1 obj_02 obj_03)
(pred_1 obj_04 obj_10)
(pred_1 obj_05 obj_11)
)
(:goal
(and
(pred_1 obj_02 obj_13)
(pred_1 obj_04 obj_11)
(pred_1 obj_05 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_10)))
)
)