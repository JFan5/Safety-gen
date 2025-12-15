(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_1
obj_12 obj_02 obj_08 obj_09 - type_3
obj_04 obj_10 obj_07 obj_11 - type_2
obj_06 obj_13 obj_03 - object)
(:init
(pred_3 obj_01 obj_04)
(pred_4 obj_01 obj_12)
(pred_4 obj_01 obj_02)
(pred_3 obj_05 obj_10)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_09)
(pred_2 obj_06 obj_07)
(pred_2 obj_13 obj_04)
(pred_2 obj_03 obj_10)
)
(:goal
(and
(pred_2 obj_06 obj_10)
(pred_2 obj_13 obj_11)
(pred_2 obj_03 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_07) (pred_3 obj_05 obj_07))))
    (always (not (and (pred_3 obj_01 obj_11) (pred_3 obj_05 obj_11))))
  )
)
)