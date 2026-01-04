(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_3
obj_07 obj_12 obj_11 obj_04 - type_2
obj_01 obj_10 obj_09 - type_1
obj_05 obj_06 obj_03 - object)
(:init
(pred_2 obj_02 obj_10)
(pred_1 obj_02 obj_07)
(pred_1 obj_02 obj_12)
(pred_2 obj_08 obj_01)
(pred_1 obj_08 obj_11)
(pred_1 obj_08 obj_04)
(pred_4 obj_05 obj_09)
(pred_4 obj_06 obj_10)
(pred_4 obj_03 obj_09)
)
(:goal
(and
(pred_4 obj_05 obj_10)
(pred_4 obj_06 obj_10)
(pred_4 obj_03 obj_09)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_09)))
)
)