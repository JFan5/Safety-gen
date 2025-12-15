(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_10 - type_1
obj_07 obj_12 obj_11 obj_02 - type_3
obj_04 obj_13 obj_05 obj_03 - type_2
obj_09 obj_01 obj_06 - object)
(:init
(pred_3 obj_08 obj_05)
(pred_4 obj_08 obj_07)
(pred_4 obj_08 obj_12)
(pred_3 obj_10 obj_04)
(pred_4 obj_10 obj_11)
(pred_4 obj_10 obj_02)
(pred_2 obj_09 obj_13)
(pred_2 obj_01 obj_13)
(pred_2 obj_06 obj_03)
)
(:goal
(and
(pred_2 obj_09 obj_05)
(pred_2 obj_01 obj_05)
(pred_2 obj_06 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_13) (pred_3 obj_10 obj_13))))
    (always (not (and (pred_3 obj_08 obj_05) (pred_3 obj_10 obj_05))))
    (always (not (and (pred_3 obj_08 obj_03) (pred_3 obj_10 obj_03))))
  )
)
)