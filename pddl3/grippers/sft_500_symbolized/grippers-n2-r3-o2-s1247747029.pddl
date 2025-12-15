(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_3
obj_02 obj_01 obj_11 obj_06 - type_2
obj_04 obj_08 obj_03 - type_1
obj_10 obj_07 - object)
(:init
(pred_2 obj_09 obj_08)
(pred_4 obj_09 obj_02)
(pred_4 obj_09 obj_01)
(pred_2 obj_05 obj_08)
(pred_4 obj_05 obj_11)
(pred_4 obj_05 obj_06)
(pred_1 obj_10 obj_08)
(pred_1 obj_07 obj_03)
)
(:goal
(and
(pred_1 obj_10 obj_03)
(pred_1 obj_07 obj_08)
)
)

(:constraints
  (always (not (pred_2 obj_09 obj_03)))
)
)