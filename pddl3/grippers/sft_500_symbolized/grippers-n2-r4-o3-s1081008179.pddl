(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_10 - type_1
obj_13 obj_11 obj_06 obj_01 - type_2
obj_02 obj_03 obj_09 obj_12 - type_3
obj_08 obj_04 obj_07 - object)
(:init
(pred_1 obj_05 obj_03)
(pred_3 obj_05 obj_13)
(pred_3 obj_05 obj_11)
(pred_1 obj_10 obj_12)
(pred_3 obj_10 obj_06)
(pred_3 obj_10 obj_01)
(pred_2 obj_08 obj_02)
(pred_2 obj_04 obj_03)
(pred_2 obj_07 obj_12)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_04 obj_12)
(pred_2 obj_07 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_05 obj_02) (pred_1 obj_10 obj_02))))
    (always (not (and (pred_1 obj_05 obj_12) (pred_1 obj_10 obj_12))))
  )
)
)