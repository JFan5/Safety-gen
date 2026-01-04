(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_2
obj_02 obj_03 obj_07 obj_12 - type_3
obj_08 obj_13 obj_06 obj_11 - type_1
obj_04 obj_09 obj_05 - object)
(:init
(pred_1 obj_10 obj_08)
(pred_4 obj_10 obj_02)
(pred_4 obj_10 obj_03)
(pred_1 obj_01 obj_11)
(pred_4 obj_01 obj_07)
(pred_4 obj_01 obj_12)
(pred_3 obj_04 obj_13)
(pred_3 obj_09 obj_06)
(pred_3 obj_05 obj_11)
)
(:goal
(and
(pred_3 obj_04 obj_06)
(pred_3 obj_09 obj_11)
(pred_3 obj_05 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_06) (pred_1 obj_01 obj_06))))
    (always (not (and (pred_1 obj_10 obj_11) (pred_1 obj_01 obj_11))))
  )
)
)