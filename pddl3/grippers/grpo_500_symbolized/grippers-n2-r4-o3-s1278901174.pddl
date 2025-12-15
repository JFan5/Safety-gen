(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_10 - type_1
obj_05 obj_06 obj_08 obj_01 - type_3
obj_07 obj_03 obj_09 obj_12 - type_2
obj_02 obj_11 obj_04 - object)
(:init
(pred_3 obj_13 obj_03)
(pred_4 obj_13 obj_05)
(pred_4 obj_13 obj_06)
(pred_3 obj_10 obj_09)
(pred_4 obj_10 obj_08)
(pred_4 obj_10 obj_01)
(pred_2 obj_02 obj_12)
(pred_2 obj_11 obj_12)
(pred_2 obj_04 obj_12)
)
(:goal
(and
(pred_2 obj_02 obj_12)
(pred_2 obj_11 obj_12)
(pred_2 obj_04 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_13 obj_12) (pred_3 obj_10 obj_12))))
  )
)
)