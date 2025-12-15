(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_14 - type_1
obj_01 obj_10 obj_09 obj_12 - type_3
obj_06 obj_08 obj_13 obj_03 - type_2
obj_04 obj_05 obj_11 obj_02 - object)
(:init
(pred_3 obj_07 obj_08)
(pred_4 obj_07 obj_01)
(pred_4 obj_07 obj_10)
(pred_3 obj_14 obj_13)
(pred_4 obj_14 obj_09)
(pred_4 obj_14 obj_12)
(pred_2 obj_04 obj_13)
(pred_2 obj_05 obj_13)
(pred_2 obj_11 obj_08)
(pred_2 obj_02 obj_03)
)
(:goal
(and
(pred_2 obj_04 obj_06)
(pred_2 obj_05 obj_06)
(pred_2 obj_11 obj_06)
(pred_2 obj_02 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_07 obj_06) (pred_3 obj_14 obj_06))))
  )
)
)