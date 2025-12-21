(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_05 - type_1
obj_06 obj_02 obj_08 obj_01 - type_3
obj_03 obj_10 obj_11 - type_2
obj_09 obj_04 obj_12 - object)
(:init
(pred_4 obj_07 obj_10)
(pred_2 obj_07 obj_06)
(pred_2 obj_07 obj_02)
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_08)
(pred_2 obj_05 obj_01)
(pred_3 obj_09 obj_03)
(pred_3 obj_04 obj_11)
(pred_3 obj_12 obj_03)
)
(:goal
(and
(pred_3 obj_09 obj_11)
(pred_3 obj_04 obj_11)
(pred_3 obj_12 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_11)))
)
)