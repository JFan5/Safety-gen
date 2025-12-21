(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_08 - type_1
obj_02 obj_01 obj_04 obj_10 - type_3
obj_09 obj_11 obj_07 - type_2
obj_03 obj_06 obj_05 - object)
(:init
(pred_4 obj_12 obj_11)
(pred_2 obj_12 obj_02)
(pred_2 obj_12 obj_01)
(pred_4 obj_08 obj_11)
(pred_2 obj_08 obj_04)
(pred_2 obj_08 obj_10)
(pred_3 obj_03 obj_11)
(pred_3 obj_06 obj_11)
(pred_3 obj_05 obj_11)
)
(:goal
(and
(pred_3 obj_03 obj_11)
(pred_3 obj_06 obj_11)
(pred_3 obj_05 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_07)))
)
)