(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_06 - type_1
obj_11 obj_04 obj_12 obj_01 - type_3
obj_03 obj_02 obj_10 - type_2
obj_08 obj_09 obj_05 - object)
(:init
(pred_3 obj_07 obj_02)
(pred_4 obj_07 obj_11)
(pred_4 obj_07 obj_04)
(pred_3 obj_06 obj_02)
(pred_4 obj_06 obj_12)
(pred_4 obj_06 obj_01)
(pred_2 obj_08 obj_03)
(pred_2 obj_09 obj_02)
(pred_2 obj_05 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_02)
(pred_2 obj_09 obj_02)
(pred_2 obj_05 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_10)))
)
)