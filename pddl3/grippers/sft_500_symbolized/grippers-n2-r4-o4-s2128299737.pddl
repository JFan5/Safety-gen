(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_04 - type_2
obj_05 obj_12 obj_03 obj_10 - type_1
obj_01 obj_09 obj_14 obj_08 - type_3
obj_06 obj_02 obj_13 obj_07 - object)
(:init
(pred_2 obj_11 obj_09)
(pred_1 obj_11 obj_05)
(pred_1 obj_11 obj_12)
(pred_2 obj_04 obj_08)
(pred_1 obj_04 obj_03)
(pred_1 obj_04 obj_10)
(pred_4 obj_06 obj_09)
(pred_4 obj_02 obj_01)
(pred_4 obj_13 obj_09)
(pred_4 obj_07 obj_01)
)
(:goal
(and
(pred_4 obj_06 obj_08)
(pred_4 obj_02 obj_08)
(pred_4 obj_13 obj_01)
(pred_4 obj_07 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_11 obj_08) (pred_2 obj_04 obj_08))))
  )
)
)