(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_09 - type_2
obj_07 obj_04 obj_01 obj_10 - type_1
obj_06 obj_12 obj_03 - type_3
obj_11 obj_05 obj_02 - object)
(:init
(pred_3 obj_08 obj_06)
(pred_4 obj_08 obj_07)
(pred_4 obj_08 obj_04)
(pred_3 obj_09 obj_12)
(pred_4 obj_09 obj_01)
(pred_4 obj_09 obj_10)
(pred_2 obj_11 obj_06)
(pred_2 obj_05 obj_12)
(pred_2 obj_02 obj_06)
)
(:goal
(and
(pred_2 obj_11 obj_03)
(pred_2 obj_05 obj_03)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_03)))
)
)