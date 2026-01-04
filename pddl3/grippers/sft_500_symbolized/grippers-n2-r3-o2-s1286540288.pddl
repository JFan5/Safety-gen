(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_11 obj_05 - type_3
obj_02 obj_03 obj_09 obj_10 - type_2
obj_01 obj_07 obj_04 - type_1
obj_08 obj_06 - object)
(:init
(pred_3 obj_11 obj_04)
(pred_1 obj_11 obj_02)
(pred_1 obj_11 obj_03)
(pred_3 obj_05 obj_07)
(pred_1 obj_05 obj_09)
(pred_1 obj_05 obj_10)
(pred_2 obj_08 obj_07)
(pred_2 obj_06 obj_07)
)
(:goal
(and
(pred_2 obj_08 obj_01)
(pred_2 obj_06 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_04) (pred_3 obj_05 obj_04))))
  )
)
)