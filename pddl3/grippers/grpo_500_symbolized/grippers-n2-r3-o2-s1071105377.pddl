(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_1
obj_08 obj_06 obj_02 obj_10 - type_3
obj_11 obj_03 obj_01 - type_2
obj_09 obj_07 - object)
(:init
(pred_3 obj_05 obj_11)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_06)
(pred_3 obj_04 obj_11)
(pred_4 obj_04 obj_02)
(pred_4 obj_04 obj_10)
(pred_2 obj_09 obj_11)
(pred_2 obj_07 obj_01)
)
(:goal
(and
(pred_2 obj_09 obj_03)
(pred_2 obj_07 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_01)))
)
)