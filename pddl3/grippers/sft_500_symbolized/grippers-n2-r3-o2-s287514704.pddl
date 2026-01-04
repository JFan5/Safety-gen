(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_10 obj_04 - type_2
obj_07 obj_01 obj_08 obj_05 - type_1
obj_02 obj_03 obj_11 - type_3
obj_06 obj_09 - object)
(:init
(pred_1 obj_10 obj_11)
(pred_3 obj_10 obj_07)
(pred_3 obj_10 obj_01)
(pred_1 obj_04 obj_11)
(pred_3 obj_04 obj_08)
(pred_3 obj_04 obj_05)
(pred_4 obj_06 obj_11)
(pred_4 obj_09 obj_03)
)
(:goal
(and
(pred_4 obj_06 obj_02)
(pred_4 obj_09 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_02)))
)
)