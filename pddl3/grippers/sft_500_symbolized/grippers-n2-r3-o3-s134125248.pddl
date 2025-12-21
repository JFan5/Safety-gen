(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_04 - type_1
obj_05 obj_12 obj_06 obj_10 - type_2
obj_03 obj_09 obj_07 - type_3
obj_02 obj_01 obj_11 - object)
(:init
(pred_1 obj_08 obj_03)
(pred_3 obj_08 obj_05)
(pred_3 obj_08 obj_12)
(pred_1 obj_04 obj_03)
(pred_3 obj_04 obj_06)
(pred_3 obj_04 obj_10)
(pred_2 obj_02 obj_03)
(pred_2 obj_01 obj_09)
(pred_2 obj_11 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_09)
(pred_2 obj_01 obj_07)
(pred_2 obj_11 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_07)))
)
)