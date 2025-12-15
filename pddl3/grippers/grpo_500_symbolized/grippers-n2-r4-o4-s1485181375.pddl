(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_06 - type_1
obj_11 obj_09 obj_05 obj_07 - type_3
obj_02 obj_10 obj_08 obj_04 - type_2
obj_01 obj_14 obj_03 obj_13 - object)
(:init
(pred_3 obj_12 obj_04)
(pred_4 obj_12 obj_11)
(pred_4 obj_12 obj_09)
(pred_3 obj_06 obj_02)
(pred_4 obj_06 obj_05)
(pred_4 obj_06 obj_07)
(pred_2 obj_01 obj_04)
(pred_2 obj_14 obj_10)
(pred_2 obj_03 obj_04)
(pred_2 obj_13 obj_04)
)
(:goal
(and
(pred_2 obj_01 obj_04)
(pred_2 obj_14 obj_04)
(pred_2 obj_03 obj_10)
(pred_2 obj_13 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_12 obj_10) (pred_3 obj_06 obj_10))))
    (always (not (and (pred_3 obj_12 obj_04) (pred_3 obj_06 obj_04))))
  )
)
)