(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_09 - type_3
obj_08 obj_05 obj_11 obj_07 - type_1
obj_01 obj_02 obj_10 - type_2
obj_04 obj_06 - object)
(:init
(pred_3 obj_03 obj_10)
(pred_4 obj_03 obj_08)
(pred_4 obj_03 obj_05)
(pred_3 obj_09 obj_10)
(pred_4 obj_09 obj_11)
(pred_4 obj_09 obj_07)
(pred_2 obj_04 obj_10)
(pred_2 obj_06 obj_01)
)
(:goal
(and
(pred_2 obj_04 obj_01)
(pred_2 obj_06 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_01)))
)
)