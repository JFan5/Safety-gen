(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_1
obj_10 obj_02 obj_03 obj_01 - type_3
obj_06 obj_12 obj_07 - type_2
obj_11 obj_08 obj_04 - object)
(:init
(pred_4 obj_09 obj_12)
(pred_2 obj_09 obj_10)
(pred_2 obj_09 obj_02)
(pred_4 obj_05 obj_12)
(pred_2 obj_05 obj_03)
(pred_2 obj_05 obj_01)
(pred_3 obj_11 obj_07)
(pred_3 obj_08 obj_12)
(pred_3 obj_04 obj_12)
)
(:goal
(and
(pred_3 obj_11 obj_12)
(pred_3 obj_08 obj_06)
(pred_3 obj_04 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_09 obj_07)))
)
)