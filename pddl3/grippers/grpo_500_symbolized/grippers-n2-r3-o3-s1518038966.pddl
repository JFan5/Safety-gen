(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_01 - type_1
obj_09 obj_04 obj_03 obj_07 - type_3
obj_12 obj_05 obj_11 - type_2
obj_02 obj_10 obj_08 - object)
(:init
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_09)
(pred_2 obj_06 obj_04)
(pred_4 obj_01 obj_12)
(pred_2 obj_01 obj_03)
(pred_2 obj_01 obj_07)
(pred_3 obj_02 obj_11)
(pred_3 obj_10 obj_11)
(pred_3 obj_08 obj_12)
)
(:goal
(and
(pred_3 obj_02 obj_11)
(pred_3 obj_10 obj_12)
(pred_3 obj_08 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_06 obj_11) (pred_4 obj_01 obj_11))))
  )
)
)