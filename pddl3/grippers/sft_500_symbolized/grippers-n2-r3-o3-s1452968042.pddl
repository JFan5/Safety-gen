(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_2
obj_05 obj_12 obj_03 obj_06 - type_1
obj_01 obj_11 obj_10 - type_3
obj_07 obj_09 obj_08 - object)
(:init
(pred_2 obj_02 obj_10)
(pred_4 obj_02 obj_05)
(pred_4 obj_02 obj_12)
(pred_2 obj_04 obj_10)
(pred_4 obj_04 obj_03)
(pred_4 obj_04 obj_06)
(pred_3 obj_07 obj_11)
(pred_3 obj_09 obj_11)
(pred_3 obj_08 obj_01)
)
(:goal
(and
(pred_3 obj_07 obj_01)
(pred_3 obj_09 obj_10)
(pred_3 obj_08 obj_10)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_11)))
)
)