(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_10 - type_1
obj_06 obj_08 obj_01 obj_11 - type_3
obj_05 obj_07 obj_02 - type_2
obj_04 obj_09 - object)
(:init
(pred_3 obj_03 obj_05)
(pred_4 obj_03 obj_06)
(pred_4 obj_03 obj_08)
(pred_3 obj_10 obj_07)
(pred_4 obj_10 obj_01)
(pred_4 obj_10 obj_11)
(pred_2 obj_04 obj_07)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_04 obj_05)
(pred_2 obj_09 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_02)))
)
)