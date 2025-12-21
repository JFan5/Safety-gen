(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_09 obj_03 obj_06 obj_05 - type_2
obj_08 obj_01 obj_07 - type_3
obj_10 obj_11 obj_04 - object)
(:init
(pred_1 obj_02 obj_08)
(pred_3 obj_02 obj_09)
(pred_3 obj_02 obj_03)
(pred_1 obj_12 obj_08)
(pred_3 obj_12 obj_06)
(pred_3 obj_12 obj_05)
(pred_2 obj_10 obj_01)
(pred_2 obj_11 obj_01)
(pred_2 obj_04 obj_08)
)
(:goal
(and
(pred_2 obj_10 obj_08)
(pred_2 obj_11 obj_07)
(pred_2 obj_04 obj_08)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_07)))
)
)