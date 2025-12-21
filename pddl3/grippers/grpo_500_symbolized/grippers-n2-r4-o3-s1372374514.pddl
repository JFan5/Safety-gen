(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_06 - type_1
obj_04 obj_01 obj_05 obj_07 - type_3
obj_09 obj_03 obj_12 obj_08 - type_2
obj_02 obj_13 obj_11 - object)
(:init
(pred_4 obj_10 obj_03)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_01)
(pred_4 obj_06 obj_09)
(pred_2 obj_06 obj_05)
(pred_2 obj_06 obj_07)
(pred_3 obj_02 obj_12)
(pred_3 obj_13 obj_12)
(pred_3 obj_11 obj_12)
)
(:goal
(and
(pred_3 obj_02 obj_12)
(pred_3 obj_13 obj_03)
(pred_3 obj_11 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_12) (pred_4 obj_06 obj_12))))
  )
)
)