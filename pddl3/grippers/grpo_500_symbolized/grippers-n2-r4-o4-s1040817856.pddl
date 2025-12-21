(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_04 - type_1
obj_02 obj_03 obj_09 obj_12 - type_3
obj_01 obj_05 obj_14 obj_10 - type_2
obj_13 obj_06 obj_11 obj_08 - object)
(:init
(pred_4 obj_07 obj_05)
(pred_2 obj_07 obj_02)
(pred_2 obj_07 obj_03)
(pred_4 obj_04 obj_01)
(pred_2 obj_04 obj_09)
(pred_2 obj_04 obj_12)
(pred_3 obj_13 obj_01)
(pred_3 obj_06 obj_01)
(pred_3 obj_11 obj_14)
(pred_3 obj_08 obj_01)
)
(:goal
(and
(pred_3 obj_13 obj_01)
(pred_3 obj_06 obj_14)
(pred_3 obj_11 obj_10)
(pred_3 obj_08 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_10) (pred_4 obj_04 obj_10))))
  )
)
)