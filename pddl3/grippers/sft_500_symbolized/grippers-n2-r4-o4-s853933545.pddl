(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_03 - type_3
obj_02 obj_13 obj_09 obj_10 - type_1
obj_01 obj_08 obj_06 obj_14 - type_2
obj_11 obj_05 obj_07 obj_04 - object)
(:init
(pred_2 obj_12 obj_06)
(pred_3 obj_12 obj_02)
(pred_3 obj_12 obj_13)
(pred_2 obj_03 obj_14)
(pred_3 obj_03 obj_09)
(pred_3 obj_03 obj_10)
(pred_4 obj_11 obj_01)
(pred_4 obj_05 obj_08)
(pred_4 obj_07 obj_01)
(pred_4 obj_04 obj_08)
)
(:goal
(and
(pred_4 obj_11 obj_08)
(pred_4 obj_05 obj_06)
(pred_4 obj_07 obj_01)
(pred_4 obj_04 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_12 obj_08) (pred_2 obj_03 obj_08))))
  )
)
)