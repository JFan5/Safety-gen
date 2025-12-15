(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_14 - type_2
obj_04 obj_08 obj_02 obj_07 - type_1
obj_06 obj_11 obj_05 obj_13 - type_3
obj_01 obj_10 obj_12 obj_09 - object)
(:init
(pred_3 obj_03 obj_11)
(pred_2 obj_03 obj_04)
(pred_2 obj_03 obj_08)
(pred_3 obj_14 obj_13)
(pred_2 obj_14 obj_02)
(pred_2 obj_14 obj_07)
(pred_1 obj_01 obj_13)
(pred_1 obj_10 obj_05)
(pred_1 obj_12 obj_05)
(pred_1 obj_09 obj_06)
)
(:goal
(and
(pred_1 obj_01 obj_06)
(pred_1 obj_10 obj_13)
(pred_1 obj_12 obj_11)
(pred_1 obj_09 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_03 obj_11) (pred_3 obj_14 obj_11))))
    (always (not (and (pred_3 obj_03 obj_13) (pred_3 obj_14 obj_13))))
  )
)
)