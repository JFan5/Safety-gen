(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_02 obj_06 - type_1
obj_08 obj_05 obj_10 obj_09 - type_3
obj_04 obj_11 obj_07 - type_2
obj_01 obj_03 - object)
(:init
(pred_4 obj_02 obj_07)
(pred_2 obj_02 obj_08)
(pred_2 obj_02 obj_05)
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_10)
(pred_2 obj_06 obj_09)
(pred_3 obj_01 obj_11)
(pred_3 obj_03 obj_11)
)
(:goal
(and
(pred_3 obj_01 obj_04)
(pred_3 obj_03 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_02 obj_07) (pred_4 obj_06 obj_07))))
  )
)
)