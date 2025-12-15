(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_1
obj_12 obj_08 obj_07 obj_11 - type_3
obj_03 obj_09 obj_10 - type_2
obj_05 obj_06 obj_01 - object)
(:init
(pred_3 obj_02 obj_09)
(pred_4 obj_02 obj_12)
(pred_4 obj_02 obj_08)
(pred_3 obj_04 obj_09)
(pred_4 obj_04 obj_07)
(pred_4 obj_04 obj_11)
(pred_2 obj_05 obj_09)
(pred_2 obj_06 obj_09)
(pred_2 obj_01 obj_03)
)
(:goal
(and
(pred_2 obj_05 obj_10)
(pred_2 obj_06 obj_10)
(pred_2 obj_01 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_10)))
)
)