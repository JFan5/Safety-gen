(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_08 - type_1
obj_01 obj_10 obj_02 obj_07 - type_3
obj_13 obj_12 obj_06 obj_03 - type_2
obj_11 obj_09 obj_05 - object)
(:init
(pred_4 obj_04 obj_06)
(pred_2 obj_04 obj_01)
(pred_2 obj_04 obj_10)
(pred_4 obj_08 obj_13)
(pred_2 obj_08 obj_02)
(pred_2 obj_08 obj_07)
(pred_3 obj_11 obj_06)
(pred_3 obj_09 obj_12)
(pred_3 obj_05 obj_03)
)
(:goal
(and
(pred_3 obj_11 obj_06)
(pred_3 obj_09 obj_06)
(pred_3 obj_05 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_03)))
)
)