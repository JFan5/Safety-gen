(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_1
obj_09 obj_06 obj_08 obj_03 - type_3
obj_11 obj_14 obj_04 obj_07 - type_2
obj_12 obj_10 obj_02 obj_13 - object)
(:init
(pred_3 obj_01 obj_07)
(pred_4 obj_01 obj_09)
(pred_4 obj_01 obj_06)
(pred_3 obj_05 obj_04)
(pred_4 obj_05 obj_08)
(pred_4 obj_05 obj_03)
(pred_2 obj_12 obj_04)
(pred_2 obj_10 obj_07)
(pred_2 obj_02 obj_04)
(pred_2 obj_13 obj_07)
)
(:goal
(and
(pred_2 obj_12 obj_07)
(pred_2 obj_10 obj_07)
(pred_2 obj_02 obj_11)
(pred_2 obj_13 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_01 obj_11) (pred_3 obj_05 obj_11))))
    (always (not (and (pred_3 obj_01 obj_07) (pred_3 obj_05 obj_07))))
  )
)
)