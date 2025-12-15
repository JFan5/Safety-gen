(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_1
obj_09 obj_03 obj_11 obj_04 - type_3
obj_02 obj_06 obj_10 - type_2
obj_05 obj_08 obj_12 - object)
(:init
(pred_3 obj_07 obj_02)
(pred_4 obj_07 obj_09)
(pred_4 obj_07 obj_03)
(pred_3 obj_01 obj_10)
(pred_4 obj_01 obj_11)
(pred_4 obj_01 obj_04)
(pred_1 obj_05 obj_02)
(pred_1 obj_08 obj_06)
(pred_1 obj_12 obj_06)
)
(:goal
(and
(pred_1 obj_05 obj_10)
(pred_1 obj_08 obj_06)
(pred_1 obj_12 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_10)))
)
)