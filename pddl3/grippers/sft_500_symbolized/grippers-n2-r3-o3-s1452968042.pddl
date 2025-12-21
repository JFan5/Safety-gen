(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_04 - type_1
obj_12 obj_02 obj_01 obj_07 - type_2
obj_09 obj_10 obj_11 - type_3
obj_03 obj_05 obj_08 - object)
(:init
(pred_1 obj_06 obj_11)
(pred_3 obj_06 obj_12)
(pred_3 obj_06 obj_02)
(pred_1 obj_04 obj_11)
(pred_3 obj_04 obj_01)
(pred_3 obj_04 obj_07)
(pred_2 obj_03 obj_10)
(pred_2 obj_05 obj_10)
(pred_2 obj_08 obj_09)
)
(:goal
(and
(pred_2 obj_03 obj_09)
(pred_2 obj_05 obj_11)
(pred_2 obj_08 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_10)))
)
)