(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_05 - type_1
obj_12 obj_10 obj_01 obj_06 - type_3
obj_08 obj_07 obj_09 - type_2
obj_11 obj_03 obj_04 - object)
(:init
(pred_4 obj_02 obj_07)
(pred_2 obj_02 obj_12)
(pred_2 obj_02 obj_10)
(pred_4 obj_05 obj_08)
(pred_2 obj_05 obj_01)
(pred_2 obj_05 obj_06)
(pred_3 obj_11 obj_08)
(pred_3 obj_03 obj_08)
(pred_3 obj_04 obj_09)
)
(:goal
(and
(pred_3 obj_11 obj_08)
(pred_3 obj_03 obj_07)
(pred_3 obj_04 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_09)))
)
)