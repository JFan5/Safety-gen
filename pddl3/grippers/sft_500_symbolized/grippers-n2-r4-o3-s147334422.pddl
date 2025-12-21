(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_1
obj_08 obj_03 obj_07 obj_09 - type_2
obj_06 obj_02 obj_12 obj_11 - type_3
obj_04 obj_05 obj_13 - object)
(:init
(pred_1 obj_10 obj_12)
(pred_3 obj_10 obj_08)
(pred_3 obj_10 obj_03)
(pred_1 obj_01 obj_11)
(pred_3 obj_01 obj_07)
(pred_3 obj_01 obj_09)
(pred_2 obj_04 obj_02)
(pred_2 obj_05 obj_06)
(pred_2 obj_13 obj_06)
)
(:goal
(and
(pred_2 obj_04 obj_12)
(pred_2 obj_05 obj_12)
(pred_2 obj_13 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_12) (pred_1 obj_01 obj_12))))
    (always (not (and (pred_1 obj_10 obj_11) (pred_1 obj_01 obj_11))))
  )
)
)